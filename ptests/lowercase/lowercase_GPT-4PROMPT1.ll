; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i64, align 8
  br label %4

4:                                                ; preds = %6, %2
  %storemerge = phi i64 [ 0, %2 ], [ %9, %6 ]
  store i64 %storemerge, ptr %3, align 8
  %5 = icmp ult i64 %storemerge, 32
  br i1 %5, label %6, label %10

6:                                                ; preds = %4
  %7 = load i64, ptr %3, align 8
  call void @doTest(i64 noundef %7)
  %8 = load i64, ptr %3, align 8
  %9 = add i64 %8, 1
  br label %4, !llvm.loop !6

10:                                               ; preds = %4
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @doTest(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
  store i64 %0, ptr %3, align 8
  %8 = add i64 %0, 15
  %9 = and i64 %8, -16
  store i64 %9, ptr %4, align 8
  %10 = shl i64 %9, 1
  %11 = call ptr @malloc(i64 noundef %10) #7
  store ptr %11, ptr %5, align 8
  br label %12

12:                                               ; preds = %15, %1
  %storemerge = phi i64 [ 0, %1 ], [ %20, %15 ]
  store i64 %storemerge, ptr %6, align 8
  %13 = load i64, ptr %4, align 8
  %14 = icmp ult i64 %storemerge, %13
  br i1 %14, label %15, label %21

15:                                               ; preds = %12
  %16 = load ptr, ptr %5, align 8
  %17 = load i64, ptr %6, align 8
  %18 = getelementptr inbounds i16, ptr %16, i64 %17
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(32) %18, ptr noundef nonnull align 16 dereferenceable(32) @staticData, i64 32, i1 false)
  %19 = load i64, ptr %6, align 8
  %20 = add i64 %19, 16
  br label %12, !llvm.loop !8

21:                                               ; preds = %12
  %22 = load i64, ptr %4, align 8
  %23 = shl i64 %22, 1
  %24 = call ptr @malloc(i64 noundef %23) #7
  store ptr %24, ptr %7, align 8
  %25 = load i64, ptr %2, align 8
  %26 = load i64, ptr %3, align 8
  %27 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %25, i64 noundef %26) #8
  %28 = load i64, ptr %4, align 8
  %29 = shl i64 %28, 1
  call void @llvm.memset.p0.i64(ptr align 2 %24, i8 0, i64 %29, i1 false)
  br label %30

30:                                               ; preds = %32, %21
  %storemerge1 = phi i64 [ 0, %21 ], [ %37, %32 ]
  store i64 %storemerge1, ptr %6, align 8
  %31 = icmp ult i64 %storemerge1, 10000000
  br i1 %31, label %32, label %38

32:                                               ; preds = %30
  %33 = load ptr, ptr %5, align 8
  %34 = load i64, ptr %3, align 8
  %35 = load ptr, ptr %7, align 8
  call void @lower_StringImpl(ptr noundef %33, i64 noundef %34, ptr noundef %35)
  %36 = load i64, ptr %6, align 8
  %37 = add i64 %36, 1
  br label %30, !llvm.loop !9

38:                                               ; preds = %30
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define internal void @lower_StringImpl(ptr noalias noundef %0, i64 noundef %1, ptr noalias noundef %2) #5 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i16, align 2
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i16 0, ptr %7, align 2
  br label %9

9:                                                ; preds = %12, %3
  %storemerge = phi i64 [ 0, %3 ], [ %24, %12 ]
  store i64 %storemerge, ptr %8, align 8
  %10 = load i64, ptr %5, align 8
  %11 = icmp ult i64 %storemerge, %10
  br i1 %11, label %12, label %25

12:                                               ; preds = %9
  %13 = load ptr, ptr %4, align 8
  %14 = load i64, ptr %8, align 8
  %15 = getelementptr inbounds i16, ptr %13, i64 %14
  %16 = load i16, ptr %15, align 2
  %17 = load i16, ptr %7, align 2
  %18 = or i16 %17, %16
  store i16 %18, ptr %7, align 2
  %19 = call zeroext i16 @toASCIILower(i16 noundef zeroext %16)
  %20 = load ptr, ptr %6, align 8
  %21 = load i64, ptr %8, align 8
  %22 = getelementptr inbounds i16, ptr %20, i64 %21
  store i16 %19, ptr %22, align 2
  %23 = load i64, ptr %8, align 8
  %24 = add i64 %23, 1
  br label %9, !llvm.loop !10

25:                                               ; preds = %9
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable
define internal zeroext i16 @toASCIILower(i16 noundef zeroext %0) #6 {
  %2 = alloca i16, align 2
  store i16 %0, ptr %2, align 2
  %3 = icmp ugt i16 %0, 64
  %4 = load i16, ptr %2, align 2
  %5 = icmp ult i16 %4, 91
  %6 = select i1 %5, i16 32, i16 0
  %7 = select i1 %3, i16 %6, i16 0
  %8 = or i16 %7, %0
  ret i16 %8
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }

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
