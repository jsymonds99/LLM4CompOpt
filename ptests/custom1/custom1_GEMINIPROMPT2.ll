; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %9

5:                                                ; preds = %1
  %6 = add nsw i32 %0, -1
  %7 = call i32 @recursive_factorial(i32 noundef %6)
  %8 = mul nsw i32 %0, %7
  br label %9

9:                                                ; preds = %5, %4
  %storemerge = phi i32 [ %8, %5 ], [ 1, %4 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  br label %5

5:                                                ; preds = %8, %1
  %6 = phi i32 [ 1, %1 ], [ %9, %8 ]
  %7 = phi i32 [ 1, %1 ], [ %10, %8 ]
  store i32 %7, ptr %4, align 4
  %.not = icmp sgt i32 %7, %0
  br i1 %.not, label %11, label %8

8:                                                ; preds = %5
  %9 = mul nsw i32 %6, %7
  store i32 %9, ptr %3, align 4
  %10 = add nsw i32 %7, 1
  br label %5, !llvm.loop !6

11:                                               ; preds = %5
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %25, %2
  %9 = phi i32 [ 0, %2 ], [ %15, %25 ]
  %10 = phi i32 [ 0, %2 ], [ %26, %25 ]
  store i32 %10, ptr %6, align 4
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %27

12:                                               ; preds = %8
  %13 = add nsw i32 %9, %10
  store i32 %13, ptr %5, align 4
  br label %14

14:                                               ; preds = %18, %12
  %15 = phi i32 [ %13, %12 ], [ %23, %18 ]
  %16 = phi i32 [ 0, %12 ], [ %24, %18 ]
  store i32 %16, ptr %7, align 4
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %25

18:                                               ; preds = %14
  %19 = sub nsw i32 %15, %16
  store i32 %19, ptr %5, align 4
  %20 = call i32 @recursive_factorial(i32 noundef %10)
  %21 = call i32 @normal_factorial(i32 noundef %16)
  %22 = sub nsw i32 %20, %21
  %23 = add nsw i32 %19, %22
  store i32 %23, ptr %5, align 4
  %24 = add nsw i32 %16, 1
  br label %14, !llvm.loop !8

25:                                               ; preds = %14
  %26 = add nsw i32 %10, 1
  br label %8, !llvm.loop !9

27:                                               ; preds = %8
  ret i32 %9
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %7, %2
  %5 = phi i32 [ 0, %2 ], [ %15, %7 ]
  store i32 %5, ptr %3, align 4
  %6 = icmp slt i32 %5, 5
  br i1 %6, label %7, label %16

7:                                                ; preds = %4
  %8 = sext i32 %5 to i64
  %9 = getelementptr inbounds [5 x i32], ptr @__const.main.as, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = getelementptr inbounds [5 x i32], ptr @__const.main.bs, i64 0, i64 %8
  %12 = load i32, ptr %11, align 4
  %13 = call i32 @doing_something(i32 noundef %10, i32 noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %10, i32 noundef %12, i32 noundef %13) #3
  %15 = add nsw i32 %5, 1
  br label %4, !llvm.loop !10

16:                                               ; preds = %4
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
