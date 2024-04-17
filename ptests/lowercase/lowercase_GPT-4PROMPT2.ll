; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %6, %2
  %.0 = phi i64 [ 0, %2 ], [ %7, %6 ]
  %4 = icmp ult i64 %.0, 32
  br i1 %4, label %5, label %8

5:                                                ; preds = %3
  call void @doTest(i64 noundef %.0)
  br label %6

6:                                                ; preds = %5
  %7 = add i64 %.0, 1
  br label %3, !llvm.loop !6

8:                                                ; preds = %3
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @doTest(i64 noundef %0) #0 {
  %2 = add i64 %0, 16
  %3 = sub i64 %2, 1
  %4 = udiv i64 %3, 16
  %5 = mul i64 %4, 16
  %6 = mul i64 2, %5
  %7 = call ptr @malloc(i64 noundef %6) #5
  br label %8

8:                                                ; preds = %12, %1
  %.0 = phi i64 [ 0, %1 ], [ %13, %12 ]
  %9 = icmp ult i64 %.0, %5
  br i1 %9, label %10, label %14

10:                                               ; preds = %8
  %11 = getelementptr inbounds i16, ptr %7, i64 %.0
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %11, ptr align 16 @staticData, i64 32, i1 false)
  br label %12

12:                                               ; preds = %10
  %13 = add i64 %.0, 16
  br label %8, !llvm.loop !8

14:                                               ; preds = %8
  %15 = mul i64 2, %5
  %16 = call ptr @malloc(i64 noundef %15) #5
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %0, i64 noundef %0)
  %18 = mul i64 2, %5
  call void @llvm.memset.p0.i64(ptr align 2 %16, i8 0, i64 %18, i1 false)
  br label %19

19:                                               ; preds = %23, %14
  %.1 = phi i64 [ 0, %14 ], [ %24, %23 ]
  %20 = icmp ult i64 %.1, 10000000
  br i1 %20, label %21, label %25

21:                                               ; preds = %19
  %22 = call i64 @lower_StringImpl(ptr noundef %7, i64 noundef %0, ptr noundef %16)
  br label %23

23:                                               ; preds = %21
  %24 = add i64 %.1, 1
  br label %19, !llvm.loop !9

25:                                               ; preds = %19
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal i64 @lower_StringImpl(ptr noalias noundef %0, i64 noundef %1, ptr noalias noundef %2) #0 {
  br label %4

4:                                                ; preds = %15, %3
  %.02 = phi i16 [ 0, %3 ], [ %12, %15 ]
  %.01 = phi i64 [ 0, %3 ], [ %16, %15 ]
  %5 = icmp ult i64 %.01, %1
  br i1 %5, label %6, label %17

6:                                                ; preds = %4
  %7 = getelementptr inbounds i16, ptr %0, i64 %.01
  %8 = load i16, ptr %7, align 2
  %9 = zext i16 %8 to i32
  %10 = zext i16 %.02 to i32
  %11 = or i32 %10, %9
  %12 = trunc i32 %11 to i16
  %13 = call zeroext i16 @toASCIILower(i16 noundef zeroext %8)
  %14 = getelementptr inbounds i16, ptr %2, i64 %.01
  store i16 %13, ptr %14, align 2
  br label %15

15:                                               ; preds = %6
  %16 = add i64 %.01, 1
  br label %4, !llvm.loop !10

17:                                               ; preds = %4
  %18 = zext i16 %.02 to i32
  %19 = and i32 %18, -128
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %22, label %21

21:                                               ; preds = %17
  br label %23

22:                                               ; preds = %17
  br label %23

23:                                               ; preds = %22, %21
  %.0 = phi i64 [ 0, %22 ], [ 1, %21 ]
  ret i64 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i16 @toASCIILower(i16 noundef zeroext %0) #0 {
  %2 = zext i16 %0 to i32
  %3 = zext i16 %0 to i32
  %4 = icmp sge i32 %3, 65
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = zext i16 %0 to i32
  %7 = icmp sle i32 %6, 90
  br label %8

8:                                                ; preds = %5, %1
  %9 = phi i1 [ false, %1 ], [ %7, %5 ]
  %10 = zext i1 %9 to i32
  %11 = shl i32 %10, 5
  %12 = or i32 %2, %11
  %13 = trunc i32 %12 to i16
  ret i16 %13
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
